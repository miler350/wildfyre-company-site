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
  
  def drop_zero(string_array)                          # this will take 2 digits ["5","4"]
    array = string_array.collect { |num| Integer(num)} # take an array of individual numbers in string form ie. ["4", "5", "6"], convert them to numbers [4,5,6] 
    if array[-2] == 0                                  # is the first number of the two slots 0?
      array[-1]                                        # if the first number is 0, just return the 2nd digit
    else                                               # if the first digit is not zero
      array.join                                       # [2,8].join -> 28 
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
  
    date_array = created_at.to_s.split("") # take the default created at value separate it into individual compoents into an array
    am_or_pm = if created_at.localtime.hour < 12 then "AM" else "PM" end # there are 24 hours of the day. if the hour is less than 12, it's AM, if not, it's pm
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
  
  def short_month_dates_and_recent(created_at)
    seconds_in_an_hour = 3600
    seconds_in_a_day = 86400
    time_elapsed = Integer(Time.now - created_at)
    if time_elapsed < seconds_in_an_hour
      "#{time_elapsed/60} minutes ago"
    elsif time_elapsed < seconds_in_a_day
      "#{time_elapsed/3600} hours ago"
    else
      date = created_at.to_formatted_s(:long).split(" ")
      short_month = date.first.split("")
      "#{short_month[0..2].join} #{date[1]} #{date[2]}"
    end
  end

end
