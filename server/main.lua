ESX = exports["es_extended"]:getSharedObject()

exports("hasPermission", function(player, permission)
  local xPlayer = ESX.GetPlayerFromId(player)
  if xPlayer then
    for i=1, #Config.Permissions[xPlayer.getGroup()] do
      if Config.Permissions[xPlayer.getGroup()][i] == permission then
        return true
      end
    end
  else
    print("ERROR: xPlayer is missing!")
  end
  return false
end)

RegisterCommand("perms_reload", function()
  load(LoadResourceFile(GetCurrentResourceName(), "config.lua"))()
  print("Permissios reloaded successfully!")
end)