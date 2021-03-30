Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC434E8DF
	for <lists+drbd-dev@lfdr.de>; Tue, 30 Mar 2021 15:21:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B7A7642053E;
	Tue, 30 Mar 2021 15:21:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC2DA4203D2
	for <drbd-dev@lists.linbit.com>; Tue, 30 Mar 2021 15:21:33 +0200 (CEST)
Received: by mail-wr1-f49.google.com with SMTP id c8so16208106wrq.11
	for <drbd-dev@lists.linbit.com>; Tue, 30 Mar 2021 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=LkSzsuk6OkyHhMGQ1Io4HJGGD7LNCqzmJHjPWX4H0o8=;
	b=F1neuwXtz2jRrEO3s517BZAonUG9yq+a+buAzWhClqrFM43jqzvc07jkCvWF5txvUi
	sfjwuWoIzE8Eh3kFlUXyoC4iNUL1aycY1lpLUUKk/gmhbRnfpMzA1ckl86/YANQQPxE+
	r+cBg8JayJKdSSSGOOL7O5GAgbJB07wqKLKA0AIV28CWFa/mDLsZghznGf27CxSLaapP
	UgvecC8skd71MO6Q6iQaxkGe3pvMEFaxMQSibQiuX3k2XqvNG1eoqDqkbjI4Cfw6SOQp
	FK4OvJmZlREKEbpUWJm/NFpskLZrRUPGLT+uQSlz2sOpYBDH8nhUVsAVTcAYrtqOuhJa
	E9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=LkSzsuk6OkyHhMGQ1Io4HJGGD7LNCqzmJHjPWX4H0o8=;
	b=o6mbGmt/LmwqM6exLcIXKSj67kmpOa/nA+k5Cq+T1tIKeE/9yO/27qXfWmcYEF+Ylg
	qKa9qB2EKztKzC/HA+OL0cSkNWlCg8/2u47LzE4x6DhYyyfg+HEereAOdiWiEsDRc4rb
	5Xvl+6Z5oJcvbKPUfXbQD2JSBkyPWEunmG0sjc6AhqX5NxTjGPawHPLQzd5AWmSmCxGS
	+Sj0ca7PSrXvcNO7D/dV3C0Pvms93W5KoYxSZT+uYXvPQCGQ6YEU027usdhCxGKn2m0R
	0qjnvs5DNVFoJg/y4CV6hpLaIP4No7uUOorFhvoosTDJi3WUj0ItBlRwvD9Xt51S5SbZ
	cR6Q==
X-Gm-Message-State: AOAM533LJcQzNGXO6MUozMjBjJ2WeJRoQF9WkNZBBjGaYxHljGBXr2bK
	Dv/uyj9CDaTiruJXBmXCWBoEbQ==
X-Google-Smtp-Source: ABdhPJz9oD6yg4b32zNBbtgJAbD0h97AdahA/HWCNM/n6pjsO2hXvdH3WUU3ljzj3XmMUS4sQ/OGZA==
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr35100628wru.361.1617110492938;
	Tue, 30 Mar 2021 06:21:32 -0700 (PDT)
Received: from dell ([91.110.221.217]) by smtp.gmail.com with ESMTPSA id
	m9sm34291744wro.52.2021.03.30.06.21.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 06:21:32 -0700 (PDT)
Date: Tue, 30 Mar 2021 14:21:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	drbd-dev@lists.linbit.com, Jens Axboe <axboe@kernel.dk>,
	Joshua Morris <josh.h.morris@us.ibm.com>, Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-block@vger.kernel.org,
	Philip Kelleher <pjk1939@linux.ibm.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <20210330132130.GK2916463@dell>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
Subject: Re: [Drbd-dev] [PATCH 00/11] Rid W=1 warnings from Block
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

T24gRnJpLCAxMiBNYXIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBUaGlzIHNldCBpcyBwYXJ0
IG9mIGEgbGFyZ2VyIGVmZm9ydCBhdHRlbXB0aW5nIHRvIGNsZWFuLXVwIFc9MQo+IGtlcm5lbCBi
dWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4g
bmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiAKPiBMZWUgSm9uZXMgKDExKToKPiAgIGJsb2NrOiBy
c3h4OiBjb3JlOiBSZW1vdmUgc3VwZXJmbHVvdXMgY29uc3QgcXVhbGlmaWVyCj4gICBibG9jazog
ZHJiZDogZHJiZF9pbnRlcnZhbDogRGVtb3RlIHNvbWUga2VybmVsLWRvYyBhYnVzZXMgYW5kIGZp
eAo+ICAgICBhbm90aGVyIGhlYWRlcgo+ICAgYmxvY2s6IG10aXAzMnh4OiBtdGlwMzJ4eDogTWFy
ayBkZWJ1Z2dpbmcgdmFyaWFibGUgJ3N0YXJ0JyBhcwo+ICAgICBfX21heWJlX3VudXNlZAo+ICAg
YmxvY2s6IGRyYmQ6IGRyYmRfc3RhdGU6IEZpeCBzb21lIGZ1bmN0aW9uIGRvY3VtZW50YXRpb24g
aXNzdWVzCj4gICBibG9jazogZHJiZDogZHJiZF9yZWNlaXZlcjogRGVtb3RlIG5vbi1jb25mb3Jt
YW50IGtlcm5lbC1kb2MgaGVhZGVycwo+ICAgYmxvY2s6IGRyYmQ6IGRyYmRfbWFpbjogUmVtb3Zl
IGR1cGxpY2F0ZSBmaWVsZCBpbml0aWFsaXNhdGlvbgo+ICAgYmxvY2s6IGRyYmQ6IGRyYmRfbmw6
IE1ha2UgY29udmVyc2lvbiB0byAnZW51bSBkcmJkX3JldF9jb2RlJyBleHBsaWNpdAo+ICAgYmxv
Y2s6IGRyYmQ6IGRyYmRfbWFpbjogRml4IGEgYnVuY2ggb2YgZnVuY3Rpb24gZG9jdW1lbnRhdGlv
bgo+ICAgICBkaXNjcmVwYW5jaWVzCj4gICBibG9jazogZHJiZDogZHJiZF9yZWNlaXZlcjogRGVt
b3RlIGxlc3MgdGhhbiBoYWxmIGNvbXBsZXRlIGtlcm5lbC1kb2MKPiAgICAgaGVhZGVyCj4gICBi
bG9jazogeGVuLWJsa2Zyb250OiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZXMKPiAgIGJsb2NrOiBk
cmJkOiBkcmJkX25sOiBEZW1vdGUgaGFsZi1jb21wbGV0ZSBrZXJuZWwtZG9jIGhlYWRlcnMKCldv
dWxkIHlvdSBsaWtlIG1lIHRvIHJlc3VibWl0IHRoZXNlPwoKPiAgZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfaW50ZXJ2YWwuYyB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X21haW4uYyAgICAgfCAzMCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVy
cy9ibG9jay9kcmJkL2RyYmRfbmwuYyAgICAgICB8IDE3ICsrKysrKysrKystLS0tLS0tCj4gIGRy
aXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMgfCAyNiArKysrKysrKysrKystLS0tLS0t
LS0tLS0tLQo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jICAgIHwgIDcgKysrKy0t
LQo+ICBkcml2ZXJzL2Jsb2NrL210aXAzMnh4L210aXAzMnh4LmMgIHwgIDIgKy0KPiAgZHJpdmVy
cy9ibG9jay9yc3h4L2NvcmUuYyAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvYmxvY2sveGVu
LWJsa2Zyb250LmMgICAgICAgfCAgNiArKystLS0KPiAgOCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKPiAKPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQo+
IENjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+Cj4gQ2M6IEpvc2h1YSBNb3JyaXMgPGpv
c2guaC5tb3JyaXNAdXMuaWJtLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+
Cj4gQ2M6IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29tPgo+IENjOiBs
aW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogUGhpbGlwIEtlbGxlaGVyIDxwamsxOTM5
QGxpbnV4LmlibS5jb20+Cj4gQ2M6IFBoaWxpcHAgUmVpc25lciA8cGhpbGlwcC5yZWlzbmVyQGxp
bmJpdC5jb20+Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
ClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNv
bQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
