require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'tashfeen',
             email: 'tashfeen@gmail.com',
             password: '123456',
             password_confirmation: '123456')
  end

  it 'user should be valid' do
    expect(subject).to be_valid
  end

  it 'user name should present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'user email should present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'user password should present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it { should have_many(:events) }

  it 'has many events' do
    expect(subject).to have_many(:events)
  end

  it { should have_many(:attendings) }

  it 'has many attendings' do
    expect(subject).to have_many(:attendings)
  end

  it { should have_many(:attended_events) }

  it 'has many events' do
    expect(subject).to have_many(:attended_events)
  end
end
