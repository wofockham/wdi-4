class DNA
  attr_reader :strand

  NUCLEOTIDES = %w(A T G C)

  def initialize(strand)
    @strand = strand
  end

  def count(needle)
    needle = needle.to_s
    @strand.count(needle.upcase)
  end

  def nucleotide_counts
    total = {}
    NUCLEOTIDES.each do |needle|
      total[needle] = count(needle)
    end
    total
  end
end

s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
dna = DNA.new(s.split(''))

puts dna.count :a
puts dna.nucleotide_counts
