require 'rails_helper'

RSpec.describe Event, :type => :model do

    subject {
        User.create(name: "tashfeen",
        email: "tashfeen@gmail.com",
        password: "123456",
        password_confirmation: "123456")

        Event.new(title: "tashfeen",
                date: "2020-03-09",
                place: "lahore",
                description: "party is on",
                creater_id: "1")
    }

    it "event should be valid" do 
        expect(subject).to be_valid
    end

    it "event title should present" do 
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "user place should present" do 
        subject.place = nil
        expect(subject).to_not be_valid
    end

    it "user description should present" do 
        subject.description = nil
        expect(subject).to_not be_valid
    end

    it { should belong_to(:creater) }

    it "has many events" do
      expect(subject).to belong_to(:creater)
    end

    it { should have_many(:attendings) }

    it "has many attendings" do
      expect(subject).to have_many(:attendings)
    end

    it { should have_many(:attendees) }

    it "has many events" do
      expect(subject).to have_many(:attendees)
    end
end