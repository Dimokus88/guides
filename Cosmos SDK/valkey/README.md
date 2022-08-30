# Create priv_validator_key.json

[Гайд на русском](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/valkey/README_RU.md)

Since the nodes of the **Cosmos SDK** ecosystem are standardized, the `priv_validator_key.json` file will also be suitable for Cosmos projects.

If you don't have this file yet - deploy via **Cloudmos** ([guide and usage example here](https://github.com/Dimokus88/guides/blob/main/Akashlytics/EN-guide.md)) this [deploy.yaml](https://github.com/Dimokus88/guides/blob/main/Cosmos%20SDK/valkey/deploy.yml) .

- After deployment is complete, in the `LOG-LOG` tab, copy the output between the `===CUT HERE===` fields to a text file on your local device:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187510333-291e1df8-85dc-492f-8a0a-36000354d857.png" width=60% </p>

You may have copied `app:` which is redundant in the file. Change the contents of the file to:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187510935-d52ba819-e3f7-4711-846f-fdd2d16faf84.png" width=60% </p>

Save the file as `priv_validator_key.json` , now you can use it for any node in the **Cosmos SDK** ecosystem.

Close the deployment, `5 AKT` will be returned to the account:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187511436-c7628eb1-68d2-4018-891b-cf8ca11ebbed.png" width=60% </p>

# Link to direct download
  
In our instructions, we use direct download links from **Google Drive**, read on for how to create such a link.

Place your file on **Google Drive** and make it readable, copy the link:
  
</p>

My link looks like:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187514481-44164557-ea9a-43be-b5ed-0a9fa465bda1.png" width=110% </p>
  
I've highlighted the part with **File ID**, copy it and paste it after `https://drive.google.com/uc?export=download&id=`, so you get a link like mine:

<p align="center"><img src="https://user-images.githubusercontent.com/23629420/187520568-c43a74e4-def5-4cc9-af87-6e234de182c8.png" width=110% </p>
  
Open the link in the browser, in incognito mode, if the file is downloaded immediately, then you did everything right!
