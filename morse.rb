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
puts 'Enter the Morse code to decode'

morse_code = gets.chomp
decoded_message = MorseCodeConverter.decode(morse_code)
puts "Decoded message: #{decoded_message}"
