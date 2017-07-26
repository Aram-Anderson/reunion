class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, paid)
    participants[name] = paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.count
  end

  def owed
    dif = @participants.transform_values do |value|
     if value - split > 0
       (value * -1 ) + split
     elsif value - split < 0
       (value *2) -split
     end
   end
  end

end
