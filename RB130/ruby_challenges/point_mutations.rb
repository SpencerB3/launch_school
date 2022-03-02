class DNA
  def initialize(strand)
    @dna_strand = strand
  end

  def hamming_distance(second_strand)
    if @dna_strand.size <= second_strand.size
      compute_difference(@dna_strand, second_strand)
    else
      compute_difference(second_strand, @dna_strand)
    end
  end

  def compute_difference(first, second)
    count = 0
    first.each_char.with_index do |nucleotide, idx|
      count += 1 if nucleotide != second[idx]
    end

    count
  end
end
