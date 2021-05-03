require "google/protobuf"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("windoze.proto", :syntax => :proto3) do
    add_message "windoze.SimpleTest" do
      optional :foo, :string, 1
    end
  end
end
module Windoze
  SimpleTest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("windoze.SimpleTest").msgclass
end

$failed = false

def test(name)
  puts "**** STARTING: #{name} ****"
  yield
  puts "**** SUCCESS: #{name} ****"
rescue => e
  puts e.to_s
  puts e.backtrace.join("\n")
  $failed = true
end

test("to_s") do
  message = Windoze::SimpleTest.new
  $result = message.to_s
  p $result
end

test("hash2") do
  (21..40).each do |i|
    p (i*i*16337).to_s.hash.to_s(16)
  end
  p Object.new.hash.to_s(16)
end

test("hash") do
  (21..40).each do |i|
    message = Windoze::SimpleTest.new({foo: (i*i*16337).to_s})
    p message.hash.to_s(16)
  end
end


abort if $failed
