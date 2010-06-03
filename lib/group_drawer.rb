class GroupDrawer
def self.draw(groups)
  pdf = PDF::Writer.new
  groups.each do |group|
    pdf.text group.name
  end
  pdf.render
end
end