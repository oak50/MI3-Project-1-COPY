# import SentimentIntensityAnalyzer class
# from vaderSentiment.vaderSentiment module.
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

import csv
 
# Functions to print sentiments
 
# Function to find the negative sentiment score
def sentiment_neg(sentence):
    sid_obj = SentimentIntensityAnalyzer()
    sentiment_dict = sid_obj.polarity_scores(sentence)
    return sentiment_dict['neg']

# Function to fine the neutral sentiment score
def sentiment_neu(sentence):
    sid_obj = SentimentIntensityAnalyzer()
    sentiment_dict = sid_obj.polarity_scores(sentence)
    return sentiment_dict['neu']

# Function to find the positive sentiment score
def sentiment_pos(sentence):
    sid_obj = SentimentIntensityAnalyzer()
    sentiment_dict = sid_obj.polarity_scores(sentence)
    return sentiment_dict['pos']

# Function to find the overall sentiment 
def sentiment_overall(sentence):
    sid_obj = SentimentIntensityAnalyzer()
    sentiment_dict = sid_obj.polarity_scores(sentence)
    if sentiment_dict['compound'] >= 0.05 :
        return "Positive"
    elif sentiment_dict['compound'] <= - 0.05 :
        return "Negative"
    else :
        return "Neutral"
   
# Driver code
if __name__ == "__main__" :

    # Create a file called 'taylor_swift.csv' to write the data to
    # Open the 'taylor_swift.csv' file and write the data to the file
    with open('taylor_swift.csv', 'w', newline='', encoding="utf8") as file:
        writer = csv.writer(file)
        # Write the header row
        writer.writerow(["albumn_name","track_title","track_number","lyric", "line","negative","neutral","positive","overall"])
        
        # Open the 'Taylor Swift' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/01-taylor_swift.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Fearless (Taylor's Version)' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/02-fearless_taylors_version.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Speak Now (Deluxe Package)' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/03-speak_now_deluxe_package.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Red (Deluxe Edition)' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/04-red_deluxe_edition.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the '1989 (Deluxe)' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/05-1989_deluxe.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Reputation' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/06-reputation.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Lover' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/07-lover.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Folklore (Deluxe Version)' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/08-folklore_deluxe_version.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)

        # Open the 'Evermore (Deluxe Version)' albumn file and write the data to the new file along with the sentiment scores
        with open('/workspace/MI3-Project-1-COPY/DATA/09-evermore_deluxe_version.csv', 'r', encoding="utf8") as csv_file:
            csv_reader = csv.reader(csv_file)
            next(csv_reader)
            for line in csv_reader:
                data = [line[0], line[1], line[2], line[3], line[4], sentiment_neg(line[3]), sentiment_neu(line[3]), sentiment_pos(line[3]), sentiment_overall(line[3])]
                writer.writerow(data)
    
