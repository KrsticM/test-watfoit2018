pragma solidity ^0.4.22;

contract Playlist {
    struct Song {
        string description;
        string url;
        uint value;
        uint voteCount;
        bool complete;
    }

    Song[] public songs;

    constructor() public {
    }

    function addSong(string description, string url, uint value) public {
        Song memory newSong = Song({
            description: description,
            url: url,
            value: value,
            voteCount: 0,
            complete: false
        });
        songs.push(newSong);
    }

    // TODO: this method should increase vote count by 1
    function vote(uint index) public {
        Song storage song = songs[index];
        song.voteCount += 1;
    }

    function closeVoting(uint index) public {
        Song storage song = songs[index];
        
        require(!song.complete, "Song is not completed!");
        
        song.complete = true;
    }

    function getSummary(uint index) public view returns (string, string, uint, bool) {
        Song storage song = songs[index];
        return (
          song.description,
          song.url,
          song.voteCount,
          song.complete
        );
    }

    // TODO: implement this method to return number of songs (uint type)
    function getSongsCount() public view returns (uint) {
        return songs.length;
    }

    function getSongVoteCount(uint index) public view returns (uint) {
        Song storage song = songs[index];
        return song.voteCount;
    }
    function isSongCompleted(uint index) public view returns (bool) {
        Song storage song = songs[index];
        return song.complete;
    }

    //Retrieving the song description
    function getSongDescription(uint index) public view returns (string) {
        Song storage song = songs[index];
        return song.description;
    }
}
