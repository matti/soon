# soon

```shell
$ gem install soon
```

```ruby

it "eventually creates 3 instances" do
  HardWorker.perform_async something: true
  soon do
    expect(Hard.count).to eq 3
  end
end

it "does it sooner than the default 1s" do
  HardWorker.perform_async something: true
  soon 0.1 do
    expect(Hard.count).to eq 3
  end
end

it "tries do do it every 2 seconds for the next two minutes" do
  HardWorker.perform_async something: true
  soon 120, interval: 2 do
    expect(Hard.count).to eq 3
  end
end
```
