class Rot

  attr_accessor :mappings, :unknown_mapping, :encryption_tokenizer, :decryption_tokenizer

  def initialize mappings, unknown_mapping, encryption_tokenizer, decryption_tokenizer
    @mappings                   = mappings
    @unknown_mapping            = unknown_mapping
    @encryption_tokenizer       = encryption_tokenizer
    @decryption_tokenizer       = decryption_tokenizer
  end

  def decrypt word
    word.scan(@decryption_tokenizer).map { |char| @mappings[char] || @unknown_mapping } * ''
  end

  def encrypt word
    word.scan(@encryption_tokenizer).map { |char| @mappings.invert[char] || @unknown_mapping } * ''
  end

end
