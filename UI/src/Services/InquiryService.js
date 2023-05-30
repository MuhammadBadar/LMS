import axios from 'axios';

const Inquiry_API_BASE_URL = "http://localhost:7100/api/Inquiry";

class InquiryService {

    getInquirys() {
        return axios.get(Inquiry_API_BASE_URL);
    }

    createInquiry(Inquiry) {
        return axios.post(Inquiry_API_BASE_URL, Inquiry);
    }

    getInquiryById(InquiryId) {
        return axios.get(Inquiry_API_BASE_URL + '/' + InquiryId);
    }

    updateInquiry(Inquiry, InquiryId) {
        return axios.put(Inquiry_API_BASE_URL + '/' + InquiryId, Inquiry);
    }

    deleteInquiry(InquiryId) {
        return axios.delete(Inquiry_API_BASE_URL + '/' + InquiryId);
    }
}

// eslint-disable-next-line import/no-anonymous-default-export
export default new InquiryService()