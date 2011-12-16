class Rot

  attr_accessor :mappings
  attr_accessor :unknown_mapping

  def initialize mappings, unknown_mapping
    @mappings        = mappings
    @unknown_mapping = unknown_mapping
  end

  def decrypt word
    word.scan(/./).map { |char| @mappings[char] || @unknown_mapping } * ''
  end

  def encrypt word
    word.scan(/./).map { |char| @mappings.invert[char] || @unknown_mapping } * ''
  end

end
