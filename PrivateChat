puts "hello world"
puts "who are u?"

user_name=ENV['USER']
puts "Greetings, #{user_name}. Whats your favourite program language?"
fav_lang=gets.chomp

if fav_lang=="ruby"
 puts "nice. try to write smth using that."
else puts"wrong answer, fellow. lucky you, not the last one.Try to write smth using that."
end

puts "Введите команду на языке Ruby:"
ruby_command = gets.chomp

puts "Введите команду операционной системы:"
os_command = gets.chomp

begin
  eval(ruby_command)
rescue StandardError => e
  puts "Ошибка при выполнении команды Ruby: #{e.message}"
end

begin
  system(os_command)
rescue StandardError => e
  puts "Ошибка при выполнении команды ОС: #{e.message}\n"
end
