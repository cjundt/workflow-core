﻿using System;
using Docker.Testify;
using MongoDB.Bson;
using MongoDB.Driver;
using Xunit;

namespace WorkflowCore.Tests.MongoDB
{    
    public class MongoDockerSetup : DockerSetup
    {
        public static string ConnectionString { get; set; }

        public override string ImageName => "mongo";
        public override int InternalPort => 27017;

        public override void PublishConnectionInfo()
        {
            ConnectionString = $"mongodb://localhost:{ExternalPort}";
        }

        public override bool TestReady()
        {
            try
            {
                var client = new MongoClient($"mongodb://localhost:{ExternalPort}");
                client.ListDatabases();
                
                var command = new BsonDocument { { "setParameter", 1 }, { "notablescan", 1 } };
                client.GetDatabase("admin").RunCommand<BsonDocument>(command);
                
                return true;
            }
            catch
            {
                return false;
            }

        }
    }

    [CollectionDefinition("Mongo collection")]
    public class MongoCollection : ICollectionFixture<MongoDockerSetup>
    {        
    }

}
