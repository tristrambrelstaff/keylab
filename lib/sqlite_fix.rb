# Needed because SQLite cannot cope with empty WHERE conditions:

def sqlite_fix(conds)
  if conds.empty?
    ["TRUE"]
  else
    conds
  end
end
  
