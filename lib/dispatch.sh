# Copyright (C) 2014 Alexandre Gaigalas
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Download from https://github.com/Mosai/workshop

# Changes zsh globbing patterns
unsetopt NO_MATCH >/dev/null 2>&1 || :

# Dispatches calls of commands and arguments
dispatch ()
{
	namespace="$1"     # Namespace to be dispatched
	arg="${2:-}"       # First argument
	short="${arg#*-}"  # First argument without trailing -
	long="${short#*-}" # First argument without trailing --

	# Exit and warn if no first argument is found
	if [ -z "$arg" ]; then
		"${namespace}_" # Call empty call placeholder
		return 1
	fi

	shift 2 # Remove namespace and first argument from $@

	# Detects if a command, --long or -short option was called
	if [ "$arg" = "--$long" ];then
		longname="${long%%=*}" # Long argument before the first = sign

		# Detects if the --long=option has = sign
		if [ "$long" != "$longname" ]; then
			longval="${long#*=}"
			long="$longname"
			set -- "$longval" "${@:-}"
		fi

		main_call=${namespace}_option_${long}


	elif [ "$arg" = "-$short" ];then
		main_call=${namespace}_option_${short}
	else
		main_call=${namespace}_command_${long}
	fi

	$main_call "${@:-}" && dispatch_returned=$? || dispatch_returned=$?

	if [ $dispatch_returned = 127 ]; then
		"${namespace}_call_" "$namespace" "$arg" # Empty placeholder
		return 1
	fi

	return $dispatch_returned
}