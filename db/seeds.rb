# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



include Util::Generation

puts "Start"
# Config defaut language
Faker::Config.locale = :vi

# Create account patient
password_user = generate_hash_password("password123")
param_patient = {
  email: "patient@gmail.com",
  name: "Patient",
  phone: Faker::PhoneNumber.cell_phone,
  status: "actived",
  role: "patient",
  national_id: Faker::Number.number(digits: 10),
  religion: "No",
  residential_address: Faker::Address.full_address,
  address: Faker::Address.full_address,
  national: "Viet Nam",
  province: "Ha Noi",
  district: "Ha Dong",
  wards: "Phuong Nguyen Trai",
  avatar: Faker::Company.logo,
  hash_password: password_user
}
#Create patient
patient = Patient.create!(param_patient)

#==========================================================
param_doctor = {
  email: "doctor@gmail.com",
  name: "Doctor",
  phone: Faker::PhoneNumber.cell_phone,
  status: "actived",
  role: "doctor",
  major: "Bac si",
  experience: "10 năm",
  national_id: Faker::Number.number(digits: 10),
  religion: "No",
  residential_address: Faker::Address.full_address,
  address: Faker::Address.full_address,
  national: "Viet Nam",
  province: "Ha Noi",
  district: "Ha Dong",
  wards: "Phuong Nguyen Trai",
  avatar: Faker::Company.logo,
  hash_password: password_user
}
#Create doctor
doctor = Doctor.create!(param_doctor)



#==========================================================
param_admin = {
  email: "admin@gmail.com",
  name: "Admin",
  phone: Faker::PhoneNumber.cell_phone,
  status: "actived",
  role: "admin",
  national_id: Faker::Number.number(digits: 10),
  religion: "No",
  residential_address: Faker::Address.full_address,
  address: Faker::Address.full_address,
  national: "Viet Nam",
  province: "Ha Noi",
  district: "Ha Dong",
  wards: "Phuong Nguyen Trai",
  avatar: Faker::Company.logo,
  hash_password: password_user
}
admin = Admin.create!(param_admin)



#==========================================================
# Fake 20 doctor
(1..20).to_a.each do |index|
  param_doctor_fake = {
    email: "doctor_#{index}@gmail.com",
    name: "Doctor #{index}",
    phone: Faker::PhoneNumber.cell_phone,
    status: "actived",
    role: "doctor",
    major: "Bac si",
    experience: "#{[*1..10].sample} năm",
    national_id: Faker::Number.number(digits: 10),
    religion: "No",
    residential_address: Faker::Address.full_address,
    address: Faker::Address.full_address,
    national: "Viet Nam",
    province: "Ha Noi",
    district: "Ha Dong",
    wards: "Phuong Nguyen Trai",
    avatar: Faker::Company.logo,
    hash_password: password_user
  }
  Doctor.create!(param_doctor_fake)
end

#==========================================================
# Fake 50 patient
(1..50).to_a.each do |index|
  param_patient_fake = {
    email: "patient_#{index}@gmail.com",
    name: "Patient #{index}",
    phone: Faker::PhoneNumber.cell_phone,
    status: "actived",
    role: "patient",
    national_id: Faker::Number.number(digits: 10),
    religion: "No",
    residential_address: Faker::Address.full_address,
    address: Faker::Address.full_address,
    national: "Viet Nam",
    province: "Ha Noi",
    district: "Ha Dong",
    wards: "Phuong Nguyen Trai",
    avatar: Faker::Company.logo,
    hash_password: password_user
  }

  Patient.create!(param_patient_fake)
end
puts "End"
