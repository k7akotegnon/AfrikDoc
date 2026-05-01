# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Pourquoi : On nettoie la base pour éviter les doublons à chaque lancement [4].
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
JoinTableDoctorSpecialty.destroy_all

# 1. Créer 5 villes
5.times do
  City.create!(name: Faker::Address.city)
end

# 2. Créer quelques spécialités
specialties = ["Cardiologue", "Généraliste", "Pédiatre", "Dentiste", "Orthopédiste"]
specialties.each do |name|
  Specialty.create!(name: name)
end

# 3. Créer 10 docteurs
10.times do
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city: City.all.sample # On lie au hasard à une ville créée plus haut
  )
  # On lui donne 1 ou 2 spécialités au hasard (Relation N-N)
  JoinTableDoctorSpecialty.create!(doctor: doctor, specialty: Specialty.all.sample)
end

# 4. Créer 20 patients
20.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample
  )
end

# 5. Créer 15 rendez-vous
15.times do
  Appointment.create!(
    date: Faker::Time.between(from: DateTime.now, to: 1.month.from_now),
    doctor: Doctor.all.sample,
    patient: Patient.all.sample,
    city: City.all.sample
  )
end

puts "Seed d'AfrikDoc terminé avec succès !"