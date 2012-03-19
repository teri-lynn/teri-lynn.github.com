unless ARGV[0]
  puts 'Usage: mkpost <title>'
  exit(1)
end

path = File.dirname(__FILE__)
date = Time.now.strftime('%Y-%m-%d')
name = ARGV[0].strip.downcase.gsub(/[^\p{Alnum} ]/, '').gsub(/ /, '-')
post = "#{path}/_posts/#{date}-#{name}.md"

File.open(post, 'w') do |file|
  file << [
    "---",
    "layout: post",
    "title: #{ARGV[0]}",
    "---",
    "\n"
  ].join("\n")
end

system('git', 'add', post)
system('subl', '-w', post)
