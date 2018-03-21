require "spec_helper"

RSpec.describe "soon" do
  it "raises after 1s by default" do
    started_at = Time.now

    expect {
      soon do
        raise "fail"
      end
    }.to raise_error "fail"

    ended_at = Time.now
    delta = ended_at - started_at
    expect(delta).to be_within(0.1).of(1.0)
  end

  it "raises after 0.1 when set" do
    started_at = Time.now

    expect {
      soon 0.1 do
        raise "fail"
      end
    }.to raise_error "fail"

    ended_at = Time.now
    delta = ended_at - started_at
    expect(delta).to be_within(0.1).of(0.1)
  end

  it "retries every 0.1 by default" do
    started_at = Time.now

    calls = []
    expect {
      soon do
        calls << Time.now
        raise "fail"
      end
    }.to raise_error "fail"

    expect(calls.size).to be_within(1).of(10)
  end

  it "retries every 0.3 when set" do
    started_at = Time.now

    calls = []
    expect {
      soon interval: 0.3 do
        calls << Time.now
        raise "fail"
      end
    }.to raise_error "fail"

    expect(calls.size).to be_within(1).of(5)
  end
end
