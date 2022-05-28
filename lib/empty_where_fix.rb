# Needed because SQLite and Postgresql cannot cope with empty WHERE conditions:

def empty_where_fix(conds)
  if conds.empty?
    ["TRUE"]
  else
    conds
  end
end
