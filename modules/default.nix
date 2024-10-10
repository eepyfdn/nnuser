{ lib, ... }:

with lib;

let
  mkUserModule = username: { config, ... }: {
    options.nnuser.${username} = {
      programs = mkOption {
        type = types.submodule (import ./programs);
        default = {};
        description = "Program configurations for ${username}";
      };
    };
  };

in {
  options.nnuser = mkOption {
    type = types.attrsOf (types.submodule mkUserModule);
    default = {};
    description = "nnuser configuration for users";
  };
}
