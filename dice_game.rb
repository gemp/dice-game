class Greed

  def self.score(roll)
    with_descriptive(roll)
    # with_string(roll)
    # with_array(roll)
    # with_enumerable(roll)
    # without_grace(roll)
    # with_hack(roll)
    # with_enumerablhack(roll)
  end

private

  # The Descriptive Way
  POINTS = {
      "1" =>  100,
      "2" =>    0,
      "3" =>    0,
      "4" =>    0,
      "5" =>   50,
      "6" =>    0,
    "111" => 1000,
    "222" =>  200,
    "333" =>  300,
    "444" =>  400,
    "555" =>  500,
    "666" =>  600,
  }.freeze

  def self.with_descriptive(roll)
    roll.sort.join.scan(/((\d)\2\2)|(\d)/).sum do |num|
      POINTS[num.compact.first]
    end
  end

  # The String Way 
  def self.with_string(roll)
    sorted = roll.sort.join
    triple = sorted.match(/([1-6])\1\1/).to_s
    aces   = sorted.gsub(/#{triple}/, '').count("1")
    fives  = sorted.gsub(/#{triple}/, '').count("5") 
    result = triple == "111" ? 1000 : triple.to_i.div(100) * 100
    result + aces * 100 + fives * 50
  end

  # The Array Way
  def self.with_array(roll)
    # scores[0] will store the value of a set of three
    scores = roll.each_with_object(Array.new(7, 0)) do |val, count|
      count[val] += 1
      count[val], count[0] = 0, val if count[val] == 3
    end
    result = scores[0] == 1 ? 1000 : scores[0] * 100
    result + scores[1] * 100 + scores[5] * 50
  end

  # The Enumerable Way
  def self.with_enumerable(roll)
    # (see shortened to 6 lines version below)
    (1..6).map do |val|
      [val, roll.count(val)]
    end.inject(0) do |sum, (val, score)|
      if score >= 3
        score -= 3
        sum += val == 1 ? 1000 : val * 100
      end
      sum + score * 50 * [nil,5,1].index(val).to_i # tortuous, I know
    end
  end

  # The Disgraceful Way
  def self.without_grace(roll)
    # all possible outcomes: 5 - 4[,1] - 3[,2][,1] - 2[,1] - 1
    (1..6).group_by do |value|
      roll.count(value)
    end.inject(0) do |sum, (score, values)|
      if score >= 3
        if values[0] == 1
          sum += 1000 + (score - 3) * 100
        else
          sum += values[0] * 100
          sum += (score - 3) * 50 if values[0] == 5
        end
      else
        sum += values.sum do |val|
          [1,5].include?(val) ? score * 50 * (val == 1 ? 2 : 1) : 0
        end
      end
      sum
    end
  end

  # The Hacky Way
  def self.with_hack(roll)
    roll.uniq.group_by do |value|
      roll.count(value)
    end.sum do |score, values|
      values.map! { |v| v == 1 ? 10 : v }
      if score >= 3
        values[0]*100 + values[0]*10*(values[0] % 5 == 0 ? score-3 : 0)
      else
        values.sum { |v| v % 5 == 0 ? v*10*score : 0 }
      end
    end
  end

  # The Enumerablhack Way
  def self.with_enumerablhack(roll)
    (1..6).map do |val|
      [val == 1 ? 10 : val, roll.count(val)]
    end.inject(0) do |sum, (val, score)|
      trio, score = val*100, score-3 if score >= 3 # love that
      sum + trio.to_i + score*50*[0,5,10].index(val).to_i
    end
  end

end
