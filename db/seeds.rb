(1..100).each do |number|
    Tasklist.create!(content: "test content" + number.to_s, status: "test status" + number.to_s)
end