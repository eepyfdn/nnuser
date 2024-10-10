{
  outputs = inputs: {};
  
  inputs = {
    wrapper-manager = {
      url = "github:viperML/wrapper-manager";
      inputs.nixpkgs.follows = "";
    };
  };
}