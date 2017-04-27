module DashboardsHelper
  def cutoff_text(string)
    string.length > 100 ? string.first(90) + "..." : string
  end
end
