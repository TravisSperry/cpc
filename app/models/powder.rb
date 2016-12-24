class Powder < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :color

  TCI_PRODUCT_FORMULATION = {
    :resin_type => {
      1 =>  'Low Cure',
      2 =>  'Acrylic',
      3 =>  'High Temperature',
      4 =>  'Specialty',
      5 =>  'Alt. Cure',
      6 =>  'Hybrids',
      7 =>  'Epoxy',
      8 =>  'Urethane',
      9 =>  'TGIC',
      10 => 'AAMA 2604',
      11 => 'AAMA 2605'
    },
    :gloss_reading => {
      0 =>  '0-9',
      1 =>  '10-19',
      2 =>  '20-29',
      3 =>  '30-39',
      4 =>  '40-49',
      5 =>  '50-59',
      6 =>  '60-69',
      7 =>  '70-79',
      8 =>  '80-89',
      9 =>  '90+'
    },
    cure_response: {
      0 =>  '12 min. @ 400F',
      1 =>  '10 min. @ 400F',
      2 =>  '10 min. @ 375F',
      3 =>  '10 min. @ 350F',
      4 =>  '10 min. @ 325F',
      5 =>  '10 min. @ 300F',
      6 =>  '10 min. @ 275F',
      7 =>  '10 min. @ 250F',
      8 =>  'Fast Cure - See TDS for recommended cure'
    },
    surface_appearance: {
      0 =>  'Smooth',
      1 =>  'Metallic',
      2 =>  'Sand',
      3 =>  'Orange Peel',
      4 =>  'Vein',
      5 =>  'Hammertone',
      6 =>  'Multi-Color',
      7 =>  'Wrinkle'
    }
  }
end