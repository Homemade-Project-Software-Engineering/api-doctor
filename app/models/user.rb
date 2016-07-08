class User < ActiveRecord::Base
  authenticates_with_sorcery!
  #Pareia os relacionamentos onde os ativos são os que o usuario é responsável por outro usuario
  #e passivo quando o usuario é cuidado por outro usuario
  #foreign_key indica quem é ele na tabela de relação. No caso do active ele é o caregiver
  has_many :active_relationships, class_name: "Relationship",foreign_key: "caregiver_id",dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",foreign_key: "patient_id",dependent: :destroy

  #atraves do active ele sabe busca o usuario ao qual ele cuida, indicando que o source é patient
  #uma vez que o rails não consegue identificar qual belongs é o que ele quer, patient or caregiver
  #Idem para o caregivers
  has_many :patients,through: :active_relationships,source: :patient
  has_many :caregivers,through: :passive_relationships,source: :caregiver
  #Necessário para criar a função de "cuidar" de alguem
  has_many :relationships,foreign_key: "caregiver_id",dependent: :destroy

  has_many :alarms

  def cuidar(other_id)
    relationships.create!(patient_id: other_id)
  end

  def cuida?(other_id)
    return true if relationships.find_by(patient_id: other_id)
    return false
  end

  def remove_caregiver!(other_id)
    relation = relationships.find_by(caregiver_id: other_id)
    relation.destroy
  end
  def remove_patient!(other_id)
    relation = relationships.find_by(patient_id: other_id)
    relation.destroy
  end
end
