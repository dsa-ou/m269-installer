m269-25j                # Activate the M269 environment
if($args.Count -gt 0) { # Change directory if one is supplied, otherwise stay in the M269 folder
    cd $args[0]
}
nb                      # Start Jupyter
exit
