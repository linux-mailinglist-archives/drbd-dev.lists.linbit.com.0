Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDxULNEql2nmvQIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 16:22:57 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC6816013D
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 16:22:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A72B16278A;
	Thu, 19 Feb 2026 16:22:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
	[209.85.161.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F69016087D
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 16:22:22 +0100 (CET)
Received: by mail-oo1-f41.google.com with SMTP id
	006d021491bc7-679aebf4e56so557953eaf.3
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771514542;
	x=1772119342; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=W0a42HPsS2WRNnKKxk79oQNkIqa+mdBipBEupoa2oeM=;
	b=fI1rdefOhL2PyTCXTEk3oG7bV/SJjxVXdiD7BZqU31pBtDlsrY+BBct2iIGn2hYUwb
	7KBcfcudD8E5wy5OMvlyVNyGqb6urIBYZwAm667nrM+KGDwaJHPdMeVI13CO5KcBJVUF
	DAeOZHLBAL7vZKaRdYhxI1EPxmUzMzqD7FW1782/8oquW5HMe0h9zEvKNuOFsVwYDKcO
	hRweasTwmVWm0e81C6OUZZ/ZhndJfm2roIdS7SmP4Ol9S5DgEK0BR5++9BapHntuSYv/
	H2pI2N84HEmkA2G8qonGHMiJKzB76pStoqISGS6uZX4Ny9TQ9YVOr48mIZWfHXgljLHT
	HO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771514542; x=1772119342;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=W0a42HPsS2WRNnKKxk79oQNkIqa+mdBipBEupoa2oeM=;
	b=KFC+zuw20viqMdiB1fT+0xGFtBsFAG1/68Ky7dT/8M8/vHnh0NqFuQCHvDqjePdysj
	Um1Vlrjqya6P+tN7D464puizwOb7H0x7Bdg0XjgoELdPnoXkkGuhrXC+H0NsTK0BEWYs
	umaeM5QgfqpVWDnO+nlyNuM2kWRqldHmzSRPgcWfEIJzp+cRKjKRLwrWor6BwbWvlNB2
	twO6UO573cGH5VW9Nk/+fDsbZeQHGGfP3M1vmGUVHLw0PxDUo7VVoZO3uPL+2K8jowqo
	PU6Yxb2kZPWKqde27N8tER97sFiYEMaF/PWvQwAJtU6bc9uAEkk5sl9xnkjOEcry/Fmw
	KXLA==
X-Gm-Message-State: AOJu0YwtYWLq2ahTmFcXJmqqHMQLJqffYITIzSEB7ArdKCBX08fAljkM
	wRbT79w4HaBsE5qdAlilQU3EDse/3JNPPBODOYuTi1koExGo54ErJERPI7jHVrJwowo=
X-Gm-Gg: AZuq6aLtPoGqU0aHWx+GkAh3RLkdGvtaJYnlh/ofnX93vTQYZgdyfNau6CScM/t9pns
	1zNINxjBxxggGEnk0X4TA2BcX819EiGoeCokDX9UlsgKtjQIhNcf9LRNXlB0h1UwLgzY2j4XWvr
	k8USNdNUsVtmZqcJNYa25QLUxuro9EXMZIUWwvf+P6QkYETrUci6lo0wqeRkw4onyRCs0KJC4rJ
	Yb6KK9udOz3SwH02v58zGKlN+YcR7a8Z9Am5nF34tSo9Dn8PrN8udQOZni79lb+TUBswDJxH+AH
	+NZV9obOcsvufIDqslj+LMmRg1woSX+Eu2rbJyROAKnZkXIExDYwXD4lq/5WvhGzapn5VM+K8DJ
	wAogJZVJzXz0WIwBc73ACKpbXvoz7/dYRd54l+jYRA6ju8WALBMhCDpKWMf4LqLFsgaeRugGigu
	9FCGN5XZrch0JwifhJJvdgyNFUVf+vt5Z4Z2+N0R0oXIKNp2Te57WyWVZ0jz//6JtUAPHQlxKR6
	/hTDw==
X-Received: by 2002:a05:6820:612:b0:677:7c5f:e1c7 with SMTP id
	006d021491bc7-67858fea339mr8563625eaf.15.1771514541947; 
	Thu, 19 Feb 2026 07:22:21 -0800 (PST)
Received: from [127.0.0.1] ([187.199.77.89]) by smtp.gmail.com with ESMTPSA id
	006d021491bc7-679aebf54f1sm1954014eaf.5.2026.02.19.07.22.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Feb 2026 07:22:21 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	=?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <20260112170412.741013-2-thorsten.blum@linux.dev>
References: <20260112170412.741013-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] drbd: Replace deprecated strcpy with strscpy
Message-Id: <177151454067.556009.8199495060801939828.b4-ty@kernel.dk>
Date: Thu, 19 Feb 2026 08:22:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:thorsten.blum@linux.dev,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:-];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.931];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,kernel.dk:mid]
X-Rspamd-Queue-Id: 5FC6816013D
X-Rspamd-Action: no action


On Mon, 12 Jan 2026 18:04:12 +0100, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().  No functional changes.
> 
> 

Applied, thanks!

[1/1] drbd: Replace deprecated strcpy with strscpy
      commit: 81b1f046ff8a5ad5da2c970cff354b61dfa1d6b1

Best regards,
-- 
Jens Axboe



