using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class VocabularyDE : BaseDomain

    {
        public string? Word { get; set; }
        public string? EnglishMeaning { get; set; }
        public string? Reference { get; set; }
        public string? Sentance { get; set; }
        public string? Pronunciation { get; set; }
        public string? Comment { get; set; }
        public string? UrduMeaning { get; set; }


    }
}
