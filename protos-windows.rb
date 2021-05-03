require "google/protobuf"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("windoze.proto", :syntax => :proto3) do
    add_message "windoze.SimpleTest" do
      optional :foo, :string, 1
      optional :bar, :string, 2
    end
    add_message "windoze.MessageTest" do
      optional :foo, :message, 1, "windoze.SimpleTest"
      optional :bar, :string, 2
    end
    add_message "windoze.RepeatedTest" do
      repeated :foo, :string, 1
      optional :bar, :string, 2
    end
  end
end
module Windoze
  MessageTest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("windoze.MessageTest").msgclass
  RepeatedTest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("windoze.RepeatedTest").msgclass
  SimpleTest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("windoze.SimpleTest").msgclass
end

obj = Windoze::SimpleTest.new({})
p obj
obj = Windoze::MessageTest.new({})
p obj
obj = Windoze::RepeatedTest.new({})
p obj
