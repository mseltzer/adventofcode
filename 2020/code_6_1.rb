class CustomsDeclarationForm1

  def initialize(file)
    f = File.open(file)
    @custom_declaration_form_array = f.readlines.map(&:chomp)
    @custom_declaration_forms = []
  end

  def unique_yes_group
    @custom_declaration_forms.map do | group_yes |
      group_yes.chars.uniq.length
    end
  end

  def run
    line_builder = ""
    @custom_declaration_form_array.each do | line |
      if line.length == 0
        @custom_declaration_forms << line_builder
        line_builder = ""
        next
      end
      line_builder = line_builder + line
    end
    @custom_declaration_forms << line_builder if line_builder != ""
    unique_yes_group.inject(0, :+)
  end

end

total_group_yes = CustomsDeclarationForm1.new("input_6_1.txt").run

print total_group_yes