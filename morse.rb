# MORSE_CODE is a constant hash that maps each letter or number to its corresponding Morse code representation.
class MorseCodeConverter
  # Addition of hash table and making it immutable
  MORSE_CODE = {
    'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.',
    'F' => '..-.', 'G' => '--.', 'H' => '....', 'I' => '..', 'J' => '.---',
    'K' => '-.-', 'L' => '.-..', 'M' => '--', 'N' => '-.', 'O' => '---',
    'P' => '.--.', 'Q' => '--.-', 'R' => '.-.', 'S' => '...', 'T' => '-',
    'U' => '..-', 'V' => '...-', 'W' => '.--', 'X' => '-..-', 'Y' => '-.--',
    'Z' => '--..', '1' => '.----', '2' => '..---', '3' => '...--', '4' => '....-', '5' => '.....',
    '6' => '-....', '7' => '--...', '8' => '---..', '9' => '----.', '0' => '-----'
  }.freeze

  # Method to convert a single character to its Morse code representation.
  def self.encode_char(char)
    # Convert the character to uppercase and look it up in the MORSE_CODE hash.
    MORSE_CODE[char.upcase]
  end

  # Method to convert a word to its Morse code representation.
  def self.encode_word(word)
    # Convert each character of the word to Morse code and join them with a space in between.
    word.chars.map { |char| encode_char(char) }.join(' ')
  end

  # Method to convert a message (multiple words) to its Morse code representation.
  def self.encode(message)
    # Split the message into individual words, convert each word to Morse code, and join them with three spaces in btwn.
    message.split.map { |word| encode_word(word) }.join('   ')
  end

  # Method to convert a Morse code character back to its original character.
  def self.decode_char(morse_char)
    # Look up the Morse code in the MORSE_CODE hash and return the corresponding character.
    MORSE_CODE.key(morse_char)
  end

  # Method to convert a Morse code word back to its original word.
  def self.decode_word(morse_word)
    # Split the Morse code word into individual Morse code characters,
    morse_word.split.map { |morse_char| decode_char(morse_char) }.join
  end

  # Method to convert a Morse code message (multiple Morse code words) back to its original message.
  def self.decode(message)
    # Split the Morse code msg into individual Morse code words, decode @ word, and join them with a single spcInBtwn.
    message.split('   ').map { |morse_word| decode_word(morse_word) }.join(' ')
  end
end

# Ask the user to choose between encoding or decoding
puts "Enter 'encode' to convert text to Morse code or 'decode' to convert Morse code to text:"
conversion_type = gets.chomp.downcase
# If the user chooses to encode text to Morse code.
if conversion_type == 'encode'
  puts 'Enter the text to encode:'
  text = gets.chomp
  encoded_message = MorseCodeConverter.encode(text)
  puts "Encoded message: #{encoded_message}"

  # If the user chooses to decode Morse code to text.
elsif conversion_type == 'decode'
  puts 'Enter the Morse code to decode:'
  morse_code = gets.chomp
  decoded_message = MorseCodeConverter.decode(morse_code)
  puts "Decoded message: #{decoded_message}"

  # If the user chooses neither 'encode' nor 'decode'.
else
  puts 'Invalid conversion type.'
end

