// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/sliide/cluster-api/api/core/v1alpha2

package v1alpha2

import (
	capierrors "github.com/sliide/cluster-api/errors"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

ClusterFinalizer: "cluster.cluster.x-k8s.io"

/// [ClusterSpec]
// ClusterSpec defines the desired state of Cluster
ClusterSpec: {
	// Cluster network configuration
	// +optional
	clusterNetwork?: null | ClusterNetwork @go(ClusterNetwork,*ClusterNetwork)

	// InfrastructureRef is a reference to a provider-specific resource that holds the details
	// for provisioning infrastructure for a cluster in said provider.
	// +optional
	infrastructureRef?: null | corev1.ObjectReference @go(InfrastructureRef,*corev1.ObjectReference)
}

/// [ClusterNetwork]
// ClusterNetwork specifies the different networking
// parameters for a cluster.
ClusterNetwork: {
	// APIServerPort specifies the port the API Server should bind to.
	// Defaults to 6443.
	// +optional
	apiServerPort?: null | int32 @go(APIServerPort,*int32)

	// The network ranges from which service VIPs are allocated.
	// +optional
	services?: null | NetworkRanges @go(Services,*NetworkRanges)

	// The network ranges from which Pod networks are allocated.
	// +optional
	pods?: null | NetworkRanges @go(Pods,*NetworkRanges)

	// Domain name for services.
	// +optional
	serviceDomain?: string @go(ServiceDomain)
}

/// [NetworkRanges]
// NetworkRanges represents ranges of network addresses.
NetworkRanges: {
	cidrBlocks: [...string] @go(CIDRBlocks,[]string)
}

/// [ClusterStatus]
// ClusterStatus defines the observed state of Cluster
ClusterStatus: {
	// APIEndpoints represents the endpoints to communicate with the control plane.
	// +optional
	apiEndpoints?: [...APIEndpoint] @go(APIEndpoints,[]APIEndpoint)

	// ErrorReason indicates that there is a problem reconciling the
	// state, and will be set to a token value suitable for
	// programmatic interpretation.
	// +optional
	errorReason?: null | capierrors.ClusterStatusError @go(ErrorReason,*capierrors.ClusterStatusError)

	// ErrorMessage indicates that there is a problem reconciling the
	// state, and will be set to a descriptive error message.
	// +optional
	errorMessage?: null | string @go(ErrorMessage,*string)

	// Phase represents the current phase of cluster actuation.
	// E.g. Pending, Running, Terminating, Failed etc.
	// +optional
	phase?: string @go(Phase)

	// InfrastructureReady is the state of the infrastructure provider.
	// +optional
	infrastructureReady: bool @go(InfrastructureReady)

	// ControlPlaneInitialized defines if the control plane has been initialized.
	// +optional
	controlPlaneInitialized: bool @go(ControlPlaneInitialized)
}

/// [APIEndpoint]
// APIEndpoint represents a reachable Kubernetes API endpoint.
APIEndpoint: {
	// The hostname on which the API server is serving.
	host: string @go(Host)

	// The port on which the API server is serving.
	port: int @go(Port)
}

// Cluster is the Schema for the clusters API
Cluster: metav1.TypeMeta & {
	metadata?: metav1.ObjectMeta @go(ObjectMeta)
	spec?:     ClusterSpec       @go(Spec)
	status?:   ClusterStatus     @go(Status)
}

// ClusterList contains a list of Cluster
ClusterList: metav1.TypeMeta & {
	metadata?: metav1.ListMeta @go(ListMeta)
	items: [...Cluster] @go(Items,[]Cluster)
}
