module Log
  def save
    puts "[LOG] Saving #{self.class} at #{Time.now}"
    result = super
    puts "[LOG] Save complete"
    result
  end
end

class User
  prepend Log
  def save
    puts "Saving user to database..."
  end
end

User.new.save
# [LOG] Saving User at 2026-01-01 10:00:00
# Saving user to database...
# [LOG] Save complete