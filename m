Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCCD6C8EC3
	for <lists+drbd-dev@lfdr.de>; Sat, 25 Mar 2023 15:13:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 605BF420966;
	Sat, 25 Mar 2023 15:13:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 307 seconds by postgrey-1.31 at mail19;
	Sat, 25 Mar 2023 15:13:04 CET
Received: from mout.web.de (mout.web.de [212.227.15.4])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DF69B420168
	for <drbd-dev@lists.linbit.com>; Sat, 25 Mar 2023 15:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679753584; i=markus.elfring@web.de;
	bh=OYODff41nifZb+8HMbixwFWZeEaw0rpy0IzNNG/XRR8=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=QAd0bzwMh431ODV73ww9SrQHsA/w3tBPIwThxS6GgBhfFFtbVZEcmco+dEjnpHFOW
	dMDnGC99pQaX4g7aZP1SvOGIld8Rj6Eks9tWFrxz6eSIp28sPRmxIT1bxlILnzMp94
	WN7QN8MdPDq9Ao7hfPZbx/iiY29FAD4bbdjJAxxZrdXvBMILi2bRr2gijFTtTFl5W2
	jw5x2uG0ZUuPd3Fegz25XbfCb6OXOt0B8SJdyPZzV2QXLSoqphDx0EUvwWSdhoYkgt
	GNKaX6t/r4/kKdzk+/ettBNgdOwZ01LAxqT5TfdRFYY4yQC1b/G9MvDBc0i6cTFd9X
	CBX5agZjI8a9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
	[213.165.67.108]) with ESMTPSA (Nemesis) id 1MzCA3-1qRs7M1MV1-00wFiU;
	Sat, 25 Mar 2023 15:07:55 +0100
Message-ID: <941709b5-d940-42c9-5f31-7ed56e3e6151@web.de>
Date: Sat, 25 Mar 2023 15:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, =?UTF-8?Q?Christoph_B=c3=b6hmwalder?=
	<christoph.boehmwalder@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
	<8d193937-532f-959f-9b84-d911984508aa@web.de>
In-Reply-To: <8d193937-532f-959f-9b84-d911984508aa@web.de>
X-Provags-ID: V03:K1:EX3CdjLZiBaTSeuHKpmza9MbCEah6E1+RyxQ0U1zGy9E5XBkqnQ
	KBYwCuTevW+vVlgcqNAs4ib9NHg/J9RjWRLHxVO353Lmgq6byW6yLfSyt7F8uN32LDIVssv
	/4aabmdG7jRUXvi6KxMMcunJDE8Yo8+SmFDxVphdCsOD9NYZ05K7ag1oqD4POGhZ1HbWPA+
	TZOIawUirrnSXwEGtrRtw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RgfJNbSG32w=;IL9ov+g8/qg7OMoVMHjF5PsG7eB
	aj9BDyVLkg/RgizlS5oHSn2whnZGoFPQfeEKoq4GyBPcdJ8X/X94iF1C+VBudI87jQb0ZjSff
	DjLhAhefr2j20N6KkVaAiiFVrF4z0B/I2c3ux+v4Ktu8AX1r0CZ/Yeegy8Z1Pct56GRil/amC
	6NFNASRRl95d1Gs4XT81qnNLd6ZHvsNNPlW5M0wm4fgMbygnMCdwg4QqB/azpkiU5405A0bMc
	i5bG37JvunniPQ/gdz02pCQ/xACm9jGoFUeuK/uZi6PzkBSy/Tthf+2deCkb+VlhhrLhmz5Y7
	iRgbphvQrXgQX9R3q7T1leeTvmb8AMu6bVkd/pTqxBiYMba7fO3e55v5+8riYG98c3yvoXZtR
	dt+Q/whLfs4OtJCS0tezuARrSfIcA+fTBtuJ9Mslv3yMMpOrKjZG13Ge5F2xqYU2BOdqtx/OF
	T6oex6lxRl+OXCWAFTGLZaJumAxkQd/i3bgzQvTK483gmFutQk66lSSVK5pyEQH1E2cz3CDli
	JEOFx0xJaC4DWqECngse254jNUW7qcG2CdvHIMwShaumqSWtjLW3kNruuF5zFJ9Q8vBub2o8C
	hYbmVmti7DQGXEZMEUsn6v+8ooRSqgR/AVMCd5VJL9EAsIld0Puc7XuCGZOdf8VNNy0lopkuT
	6H3Z7Celt2//Nn0Hs1thRMPstTWtP/d5gDq+Pt3+nBid2nOIFOX4qO7tVQACKGBWExrEtMBSq
	kHUOHm6N/dtpHslrRpXTmcevTT2Ib777XoM8U1xK48LxCI7QL/f4spJ6L3wlqNajD3AJAhzcP
	BFvsoZ2IrvEEEbRbIsPpDWh0i/h+ARK+MUkpaRmwsyxqsJd2yTIFCOyoUI5EKxFYORPvRvrYx
	cguwPxty+qhCYM/RFZbZ565hT7G0vQQQvk4nuBijXAlIR0TbtX8e5CG4/
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: [Drbd-dev] [PATCH resent] drbd: Fix exception handling in
 nla_put_drbd_cfg_context()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

RGF0ZTogRnJpLCAxNyBNYXIgMjAyMyAxODozMjowNSArMDEwMAoKVGhlIGxhYmVsIOKAnG5sYV9w
dXRfZmFpbHVyZeKAnSB3YXMgdXNlZCB0byBqdW1wIHRvIGFub3RoZXIgcG9pbnRlciBjaGVjawpk
ZXNwaXRlIG9mIHRoZSBkZXRhaWwgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlv
bgrigJxubGFfcHV0X2RyYmRfY2ZnX2NvbnRleHTigJ0gdGhhdCBpdCB3YXMgZGV0ZXJtaW5lZCBh
bHJlYWR5IHRoYXQKdGhlIGNvcnJlc3BvbmRpbmcgdmFyaWFibGUgY29udGFpbmVkIGEgbnVsbCBw
b2ludGVyLgoKKiBUaHVzIHJldHVybiBkaXJlY3RseSBhZnRlciBhIGNhbGwgb2YgdGhlIGZ1bmN0
aW9uCiAg4oCcbmxhX25lc3Rfc3RhcnRfbm9mbGFn4oCdIGZhaWxlZC4KCiogRGVsZXRlIGFuIGV4
dHJhIHBvaW50ZXIgY2hlY2sgd2hpY2ggYmVjYW1lIHVubmVjZXNzYXJ5CiAgd2l0aCB0aGlzIHJl
ZmFjdG9yaW5nLgoKClRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5l
bGxlIHNvZnR3YXJlLgoKRml4ZXM6IDU0M2NjMTBiNGNjNWM2MGFhOWZjYzYyNzA1Y2NmYjk5OThi
ZjQ2OTcgKCJkcmJkOiBkcmJkX2FkbV9nZXRfc3RhdHVzIG5lZWRzIHRvIHNob3cgc29tZSBtb3Jl
IGRldGFpbCIpClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIHwgNSArKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jIGIvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfbmwuYwppbmRleCBmNDlmMmE1MjgyZTEuLjljYjk0NzEyNzQ3MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJi
ZF9ubC5jCkBAIC0zMTg3LDcgKzMxODcsNyBAQCBzdGF0aWMgaW50IG5sYV9wdXRfZHJiZF9jZmdf
Y29udGV4dChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCXN0cnVjdCBubGF0dHIgKm5sYTsKIAlubGEg
PSBubGFfbmVzdF9zdGFydF9ub2ZsYWcoc2tiLCBEUkJEX05MQV9DRkdfQ09OVEVYVCk7CiAJaWYg
KCFubGEpCi0JCWdvdG8gbmxhX3B1dF9mYWlsdXJlOworCQlyZXR1cm4gLUVNU0dTSVpFOwogCWlm
IChkZXZpY2UgJiYKIAkgICAgbmxhX3B1dF91MzIoc2tiLCBUX2N0eF92b2x1bWUsIGRldmljZS0+
dm5yKSkKIAkJZ290byBubGFfcHV0X2ZhaWx1cmU7CkBAIC0zMjA1LDggKzMyMDUsNyBAQCBzdGF0
aWMgaW50IG5sYV9wdXRfZHJiZF9jZmdfY29udGV4dChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCXJl
dHVybiAwOwoKIG5sYV9wdXRfZmFpbHVyZToKLQlpZiAobmxhKQotCQlubGFfbmVzdF9jYW5jZWwo
c2tiLCBubGEpOworCW5sYV9uZXN0X2NhbmNlbChza2IsIG5sYSk7CiAJcmV0dXJuIC1FTVNHU0la
RTsKIH0KCi0tCjIuNDAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20K
aHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
