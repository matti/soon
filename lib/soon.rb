def soon(duration=1, interval: 0.1, &block)
  retry_until = Time.now + duration

  begin
    block.call
  rescue Exception => ex
    raise ex if Time.now >= retry_until

    sleep interval
    retry
  end
end
