class Rot

  attr_accessor :mappings, :unknown_mapping, :tokenizer

  def initialize mappings, unknown_mapping, tokenizer
    @mappings        = mappings
    @unknown_mapping = unknown_mapping
    @tokenizer       = tokenizer
  end

  def decrypt word
    word.scan(@tokenizer).map { |char| @mappings[char] || @unknown_mapping } * ''
  end

  def encrypt word
    word.scan(@tokenizer).map { |char| @mappings.invert[char] || @unknown_mapping } * ''
  end

end
