package com.sapient.multiform;

/**
 * A simple service interface
 */
public interface HelloService {
    
    /**
     * @return the name of the underlying JCR repository implementations
     */
    public String getRepositoryName();

}