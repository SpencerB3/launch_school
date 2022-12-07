class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(new_strand)
    count = 0
    points = @trand.size >= new_strand.size ? new_strand.size : strand.size

    points.times do |idx|
      count += 1 if @original_strand[idx] != new_strand[idx]
    end

    count
  end
end
