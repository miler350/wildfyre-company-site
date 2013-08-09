module ApplicationHelper
  
  def abbreviate(string)
    collection = []
    string.split(" ").each do |word|
      collection << word[0].capitalize 
    end
    collection.join
  end
  
  def stylish_numbers(number)
    nums_array = number.to_s.split("")
    if nums_array.count > 3
      nums_array[-3,0] = "."
      2.times do nums_array.pop end
        "$#{nums_array.join}k"
      else
        "$#{number}"
      end
  end
  
  def drop_zero(string_array)
    array = string_array.collect { |num| Integer(num)}
    if array.to_a.include? 0
      new = array.to_s.sub("0","").split("").to_a
      new[-2]
    else
      array
    end
  end
  
  
  def format_created_at(created_at)
    date_array = created_at.to_s.split("")
    "#{drop_zero(date_array[5,2])}.#{drop_zero(date_array[8,2])}.#{date_array[2,2].join}"
  end
  
  def format_created_at_with_slash(created_at)
    date_array = created_at.to_s.split("")
    "#{drop_zero(date_array[5,2])}/#{drop_zero(date_array[8,2])}/#{date_array[2,2].join}"
  end
  
  def format_time_created_at(created_at)
    date_array = created_at.to_s.split("")
    am_or_pm = if created_at.localtime.hour < 12 then "AM" else "PM" end
     "#{drop_zero(date_array[11,2])}:#{date_array[14,2].join} #{am_or_pm}"
  end
  
  def short_url(url)
  
    #insert method
  end


  def first_initial_last_name(name)
    split_names = name.split(" ")
    first_letter = split_names.first.split("").first.capitalize
    last_name = split_names[-1].capitalize
    "#{first_letter}. #{last_name}"
  end
  
  def am_or_pm(time)
    if time.localtime.hour < 12 
      "AM"
    else
      "PM"
    end
  end

end
