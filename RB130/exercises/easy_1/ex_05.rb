ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_with_object([]) do |encrypted_name, result|
    result << decrypt_name(encrypted_name)
  end
end

def decrypt_name(name)
  result = ""

  name.each_char do |char|
    result += case char
              when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
              when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
              else
                char
              end
  end

  result
end

puts rot13(ENCRYPTED_PIONEERS)
