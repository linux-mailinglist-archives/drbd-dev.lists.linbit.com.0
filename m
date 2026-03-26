Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJN6KQVCxWkU8wQAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Mar 2026 15:26:13 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 465D1336BCE
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Mar 2026 15:26:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4C93160878;
	Thu, 26 Mar 2026 15:26:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6E38B160878
	for <drbd-dev@lists.linbit.com>; Thu, 26 Mar 2026 15:25:58 +0100 (CET)
Received: by mail-wm1-f48.google.com with SMTP id
	5b1f17b1804b1-48538c5956bso9387845e9.0
	for <drbd-dev@lists.linbit.com>; Thu, 26 Mar 2026 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774535157;
	x=1775139957; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=UDKMEMGA1dLorZrQtzBtCoFtQxCUON3awe40726T00I=;
	b=Dy+0Cla0mSfs8pfxe7ZZDnM9ZKZtfSzMuE2VUj1xrCkBqxW9Jb994sURv/pjFJWpje
	amR96VyriVeS7kYbDi63rUp2b1aZdnjBpDCN3IRz15ShlaGTNDJIU7ty5NU3A9Ta3Xln
	qrVePRXxQVeUdCcg6E6Qc8Pq3+wLkkbSwjeXODZwGfbJALjyV61mfSukYOVAFpf4OPoq
	9uHBm5x2arsHIYf10IxRxagoCe2XEXEexzrn0JOhb6CnK+367TGNIiUVGMLHTJMCSNwj
	PsrastCNEQvbMkpH5sSQx32g12s1YYzAUXm1AEtLxs43+gGKJKc+cSEEMypd+TWEalxf
	6TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774535157; x=1775139957;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=UDKMEMGA1dLorZrQtzBtCoFtQxCUON3awe40726T00I=;
	b=CN5Yeaaw9mlO1ONaiy1yyDcwF5fGsmkb/TCYeePljVWewxA8F6sHEAEe5n0w2YGZN7
	LlJVaIPvOLE8RnRPk+PtvKT/B+tdomBW83prngCoLWn4iCcVrJKK29TGRuMf/taBx8mI
	3/u8AIKjShpDfUoYl+i79jKf7i1h2BG14ROZJyyR10ammjf6N82xWHE2eNu9BhLQEUdI
	ehdJCSaVPgw1/oYOKIfWwvZE8+Dv6ZB0wga1kUgDu7z3If4yejG1YyB+YtqJyXrhp/OI
	8HEssBDoBiLLAhe/aPgKfTOuUv7Evp3Krv0Hry1QbQv56UjB2PKpeewjdfIddtKYAqIv
	Yokg==
X-Gm-Message-State: AOJu0YzfwVf77SX8NQBZRYbUChmOFWIHXU2SI/XWVhYSOKLEDDd+sadV
	B8Kz9XZC7gN0dBGeTXTz8nRo7aDwDgsjAG8+IWe524BZvhavL8dYSil9PInlZMN7wtoL8A==
X-Gm-Gg: ATEYQzzRdMnu5CXJHp5vnHq3AM348UPOY8pcnXQbhq3KkD7szQDRiK32J38KPtooRgX
	v5K+fR/EPnX02ZuKLVhpE065I/G7AuEnjUulIBQ7lUyMkuJaZ3l4cOo6zdVwBjGhhU+16TZgi06
	11dT83W3J+dts5geiwr2NoApNYQKWrcad61OhAjuD5m7xgDj9ydNln+qo30K0TW91F4PW+UbsO3
	Xmjm5RLkAwjaArHnaGXEvqC5yNaW0rsKDXzjuX7eKv1JYc7YI6vs3ElVpr9eruRsy8Hd1HmjQoZ
	ruK0Y3BBE9h6YqqyaAg5SQxeH5cdmxeqKaVOZFPmF4Ue7uTQv1Fv8DN+hRHIdfBIQNisiL3p6xo
	BX5lBsWxwZUTTfUES+LmTCJMiNc8ZBEvAB+OeQaS3sIkIy9/2IDHRAeuagz4R+e3Udeg+d4EcA4
	G79oPMvjXo+8W1u5bDqTV7WEtJTHv6aFk+rNdquHhWbFRD2ZgZlipIANBDDhMXGb+rAPhvEBvWT
	cdzKQnczFxEEW3ydy4=
X-Received: by 2002:a05:600d:16:b0:485:3428:774c with SMTP id
	5b1f17b1804b1-48722ba90cbmr21105645e9.4.1774535157471; 
	Thu, 26 Mar 2026 07:25:57 -0700 (PDT)
Received: from [10.43.5.171] (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-4872090fb74sm20030635e9.7.2026.03.26.07.25.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 26 Mar 2026 07:25:56 -0700 (PDT)
Message-ID: <d7c66265-5df2-40c9-830e-57df5924b271@linbit.com>
Date: Thu, 26 Mar 2026 15:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drbd: A few bug fixes
To: Ethan Tidmore <ethantidmore06@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
References: <20260317232318.18923-1-ethantidmore06@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260317232318.18923-1-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.922];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linbit.com,kernel.dk];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid]
X-Rspamd-Queue-Id: 465D1336BCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 00:23, Ethan Tidmore wrote:
> Here are 4 bug fixes found with Smatch.
> 
> Ethan Tidmore (4):
>    drbd: Fix out-of-bounds access
>    drbd: Fix variable dereference before check
>    drbd: Add missing error code in drbd_main.c
>    drbd: Add check for error pointer
> 
>   drivers/block/drbd/drbd_main.c     | 1 +
>   drivers/block/drbd/drbd_nl.c       | 2 +-
>   drivers/block/drbd/drbd_receiver.c | 2 +-
>   drivers/block/drbd/drbd_req.c      | 4 +++-
>   4 files changed, 6 insertions(+), 3 deletions(-)
> 

Thanks, these all look good.
I'll squash them into the DRDB9 series to keep the history clean.

Regards,
Christoph
