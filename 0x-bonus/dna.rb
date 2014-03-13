class DNA
  attr_reader :strand

  NUCLEOTIDES = %w(A T G C)

  def initialize(strand)
    @strand = strand
  end

  def count(needle)
    nucleotide_count = 0
    nucleotides = @strand.split('')
    nucleotides.each do |n|
      if (needle.upcase == n.upcase)
        nucleotide_count += 1
      end
    end
    nucleotide_count
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
dna = DNA.new(s)

puts dna.nucleotide_counts