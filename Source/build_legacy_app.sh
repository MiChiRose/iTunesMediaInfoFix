#!/bin/bash

# --- LEGACY BUILDER FOR 10.4 - 10.6 ---
APP_NAME="iTunesMediaInfoFix_Legacy"
APP_PATH="$HOME/Desktop/$APP_NAME.app"
CUSTOM_ICON="$HOME/Desktop/folder-wood.icns"

echo "--- Building ULTRA-LEGACY Version (10.4-10.6) ---"

rm -rf "$APP_PATH"

cat << 'EOF' > /tmp/legacy_main.applescript
-- iTunesMediaInfoFix: Legacy Edition for Tiger/Leopard
-- Minimal dependencies, uses native OS X UNIX tools

set appName to "iTunesFix Legacy"

display dialog "Welcome to the Legacy Edition!" & return & return & "This version is optimized for Mac OS X 10.4 - 10.6." & return & "It will unify split albums locally using a high-speed internal engine." with title appName buttons {"Cancel", "Start Merge"} default button "Start Merge"

if button returned of result is "Start Merge" then
	try
		display notification "Analyzing library..." with title appName
		
		-- Step 1: Dump Library to text via AppleScript
		set dumpScript to "set out to \"\"
tell application \"iTunes\"
	set trks to every track of library playlist 1
	repeat with t in trks
		set alb to album of t
		if alb is not \"\" then
			set out to out & (persistent ID of t) & \"|\" & (artist of t) & \"|\" & alb & ASCII character 10
		end if
	end repeat
end tell
return out"
		
		set rawData to run script dumpScript
		
		-- Step 2: Use Perl (native to Tiger) to find duplicates and pick the most common album name
		-- Perl is much faster and safer for older Macs than pure AppleScript lists
		set perlScript to "
		my %groups;
		foreach my $line (split /\\n/, $ARGV[0]) {
			my ($pid, $art, $alb) = split /\\|/, $line;
			next unless $alb;
			my $norm = lc($alb);
			$norm =~ s/[^a-z0-9а-яё\\s]/ /gi;
			$norm =~ s/\\s+/ /g;
			$norm =~ s/^\\s+|\\s+$//g;
			my $key = lc($art) . '::' . $norm;
			push @{$groups{$key}}, {pid => $pid, alb => $alb};
		}
		
		my $commands = '';
		foreach my $key (keys %groups) {
			my @tracks = @{$groups{$key}};
			my %counts;
			$counts{$_->{alb}}++ for @tracks;
			my @unique = keys %counts;
			if (@unique > 1) {
				my $main_alb = (sort { $counts{$b} <=> $counts{$a} } @unique)[0];
				foreach my $t (@tracks) {
					if ($t->{alb} ne $main_alb) {
						my $clean_main = $main_alb;
						$clean_main =~ s/\"/\\\\\"/g;
						$commands .= qq(tell application \"iTunes\" to set album of (some track whose persistent ID is \"$t->{pid}\") to \"$clean_main\"\\n);
					}
				}
			}
		}
		print $commands;
		"
		
		set fixCommands to do shell script "perl -e " & quoted form of perlScript & " " & quoted form of rawData
		
		-- Step 3: Execute fixes if any were found
		if fixCommands is not "" then
			run script fixCommands
			display dialog "Merge complete! Your split albums have been unified." with title appName buttons {"OK"} default button "OK"
		else
			display dialog "Your library is already perfect. No split albums found." with title appName buttons {"OK"} default button "OK"
		end if
		
	on error err
		display dialog "An error occurred: " & err with title appName buttons {"OK"}
	end try
end if
EOF

osacompile -o "$APP_PATH" /tmp/legacy_main.applescript

if [ -f "$CUSTOM_ICON" ]; then
    cp "$CUSTOM_ICON" "$APP_PATH/Contents/Resources/applet.icns"
fi
touch "$APP_PATH"

echo "--- Legacy App Ready at $APP_PATH ---"
