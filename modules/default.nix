{ lib, ... }:

with lib;

let
  userConfiguration = mkOption {
    type = types.attrsOf (types.submodule) {
      options = {
        programs = mkOption {
          type = types.submodule (import ./programs);
          default = {};
          description = "Program configurations for ${username}";
        };
      };
    };
    default = {};
    description = "User configurations";
  };

in {
  options.nnuser = mkOption {
    type = types.attrsOf (types.submodule userConfiguration);
    default = {};
    description = "nnuser configuration for users";
  };
}
