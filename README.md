#Encrypted Hashes

This command-suite utility encrypts an array of hashes for storing stuff.

##Requirements

  1. Data is encrypted.
  1. When initially using the command-suite, it prompts for a password.
  1. The password enables showing the hash for a short time.
  1. After a short time, the program prompts for the password.
  1. User initializes a new data file.
  1. User changes the password for a data file.
  1. User adds a hash.
  1. User finds hashes by regex matching values.
  1. Program outputs select keys and values of matches.
  1. Program optionally displays hashes with color showing matches.
  1. User updates a hash.
  1. User deletes a hash.

##Example Design

$ ehash new
# => Creates a new data file in the default location.

$ ehash -f /home/me/ehash.yml.enc new
# => Creates a new data file in /home/me/ehash.yml.enc.

$ ehash password
# => Old password: ########
# => New password: ########
# => New password again: ########
# => Changes password of data file.

$ ehash add username:monty,password:pyth0n
# => Saves a new hash { id:<new>, version:1, username:monty, password:pyth0n } to the data file.

$ ehash find mon
# => { id:100, username:monty, password: pyth0n }

$ ehash -o password find mon
# => { password: pyth0n }

