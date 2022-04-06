rm artifacts.* content.*
cp ../templates/release/* .
./eclipse \
	-nosplash \
	-application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
	-metadataRepository file:$PWD \
	-artifactRepository file:$PWD \
	-source $PWD \
	-publishArtifact \
	-compress
./eclipse\
	-nosplash \
	-application org.eclipse.equinox.p2.publisher.CategoryPublisher \
	-metadataRepository file:$PWD \
	-categoryDefinition file:$PWD/category.xml \
	-categoryQualifier \
	-compress